/*
This is the lockstep, networking library for grate.
Grate inputs are wrapped through the network and each command is formatted such that:

                  byte 1    byte 2   byte 3   byte 4
NAME            [INPUT ID] [DATA 1] [DATA 2] [DATA ...]    SET API                  GET API
KeyPress            D        key      0                 SendCode('D', key, 0)       GetCode('D', key, 0)
KeyJustPressed      d       key1     key2               SendSets('d', key1, key2)   GetSets('d')
MouseDown           V       button                      SendCode('V', button, 0)    GetCode('V', button, 0)
MouseX              x        %255    /255               SendSets('x', %255, /255)   GetSets('x')
MouseY              y        %255    /255               SendSets('y', %255, /255)   GetSets('y')
ScrollX             z        %255                       SendSets('z', %255, 0)      GetSets('z')
ScrollY             s        %255                       SendSets('s', %255, 0)      GetSets('s')
JoystickButton      J      joystick  button             SendCode('J', joystick, b)  GetCode('J', joystick, b)
JoystickAxis      150-156  joystick  %255               SendBoth('#', joy, %255)    GetBoth('#', joy)

Multitouch         0-9       %255    /255               SendSets('0', %255, /255)   GetSets('0')

Width				w		%255	/255				SendSets('w', %255, /255)   GetSets('w')
Height				h		%255	/255				SendSets('h', %255, /255)   GetSets('h')

*/

import python
import android

method set.player(n) {
	.python {
		global Network_User
		Network_User = n
	}
	.android {
		Network_User = (byte)(n.intValue());
	}
}

type Network {
	|| connection
	
	time
	client, server
}

method new(Network) {	
	.python {
		global Networking_Enabled
		global Network_Me
		
		Networking_Enabled = True
	}
	
	.android Networking_Enabled = true;
	
	if load(1)
		!connection = open("tcp://"+load(1)+":8000")
		client = true
	else
		!load("tcp://8000")
		connection = open("tcp://8000")
		server = true
	end
	
	.python Network_Me = client 
	.android Network_Me = (byte)client.intValue();
}

method Network.GetState() {
	.python {
		global Network_LocalState
		global Network_Queue
		
		if len(Network_LocalState) > 0:
			\t stack.share([i_div(len(Network_LocalState), 3)]+list(Network_LocalState))
			\t Network_Queue.put(Network_LocalState)
			\t Network_LocalState=[]
			\t return
		Network_Queue.put([])
	}
	
	.android {
		if (Network_LocalState.List.size() > 0) {
			stack.share((new Stack.Array(Network_LocalState.size().div(new Stack.Number(3)))).join(Network_LocalState));
			Network_Queue.add(Network_LocalState);
			Network_LocalState = new Stack.Array();
			return;
		}
		Network_Queue.add(new Stack.Array());
	}
	
	return text([1, number('T'), number('I'), number('C')])
}

method Network.SetState(""state) {
	var s = server
	var c = client
	
	.python {
		global Network_GlobalState
		global Network_LocalState
		global Network_Queue
		global Network_Sent
		
		Network_GlobalState.clear()
		Network_Sent.clear()
		
		NextState = Network_Queue.get()
		Network_Queue.task_done()
		if len(NextState) > 2:
			\t Network_SetState(NextState, s)
	}
	
	.android {
		Network_GlobalState.clear();
		Network_Sent.clear();
		
		Stack.Array NextState;
		try {
			NextState = Network_Queue.take();
		} catch (Exception e) {
			NextState = null;
		}
		if (NextState.List.size() > 2) {
			Network_SetState(NextState, s);
		}
	}
	
	if len(state) < 3
		return
	end
	
	if state = "TIC"
		return
	end
	
	.python Network_SetState(state, c)
	.android Network_SetState(state, c);

	//print("Setting state to ", state, " on time ", time)
}

method update(Network) {
	!
	if client
		if time = 0
			print("I am the client! Connecting to server...")
			connection("0\n")
			time = number(connection())
			
			//This is the buffer.
			connection(Network.GetState())
			//connection(Network.GetState())

			time = time + 1
		else
		
			!connection(Network.GetState())
			 
			var length = number(connection(1)[0])
			Network.SetState(connection(length*3))
			
			time = time + 1
		end
	end
	
	if server
		if time = 0
			print("I am the server, waiting for a client...")
			var c = connection() 
			if c != "0"
				print("Invalid response from client! EXITING ", c)
				exit
			end
			connection(text(time+1))
			connection("\n")
			
			//This is the buffer.
			connection(Network.GetState())
			//connection(Network.GetState())

			time = time + 1
		else

			var length = number(connection(1)[0])
			var state = connection(length*3)
			connection(Network.GetState())
			
			Network.SetState(state)
			
			time = time + 1
		end
	end
}
