 //Python Lockstep Implementation.
.python {
	Network_Sent = {}
	Network_LocalState = []
	Network_GlobalState = {}
	Networking_Enabled = False
	
	#This stores the Set-Cache that can be cached eg. Mouse, Width & Height.
	Networking_Cache = {}
	
	Network_User = 1
	Network_Me = 1
	
	Network_Queue = queue.Queue()

	def Network_SendCode(id, data1, data2):
		\t global Networking_Enabled
		\t global Network_Sent
		\t global Network_LocalState
		\t global Network_GlobalState
		\t code = chr(0)+chr(Network_Me)+chr(id)+chr(data1)+chr(data2) 
		
		# Local input.
		\t if not Networking_Enabled: 
			\t\t Network_GlobalState[code] = True
			\t\t return
		
		\t if code in Network_Sent and Network_Sent[code]:
			\t\t return
		\t Network_LocalState += [id, data1, data2]
		\t Network_Sent[code] = True
	
	def Network_GetCode(id, data1, data2):
		\t global Network_GlobalState
		\t global Network_NetworkEnabled
		\t code = chr(0)+chr(Network_User)+chr(id)+chr(data1)+chr(data2) 
		\t if code in Network_GlobalState and Network_GlobalState[code]:
		
			# Local input.
			\t\t if not Networking_Enabled:
				\t\t\t Network_GlobalState[code] = False
				
			\t\t stack.push(1)
			\t\t return True
		
	def Network_SendSets(id, data1, data2):
		\t global Networking_Enabled
		\t global Network_Sent
		\t global Network_LocalState
		\t global Network_GlobalState
		\t global Networking_Cache
		
		# Local input.
		\t if not Networking_Enabled: 
			\t\t Network_GlobalState[chr(1)+chr(Network_Me)+chr(id)] = [data1, data2]
			\t\t return
		
		\t if chr(id) in Network_Sent and Network_Sent[chr(id)]:
			\t\t return
			
		\t if chr(id) in Networking_Cache and Networking_Cache[chr(id)] == [data1, data2]:
			\t\t return
		
		\t Network_LocalState += [id, data1, data2]
		\t Network_Sent[chr(id)] = True
	
	def Network_GetSets(id):
		\t global Network_GlobalState
		\t global Network_NetworkEnabled
		\t code = chr(1)+chr(Network_User)+chr(id)
		\t if code in Network_GlobalState:
		
			# Local input.
			\t\t if not Networking_Enabled:
				\t\t\t r = Network_GlobalState[code]
				\t\t\t Network_GlobalState[code] = [0, 0]
				\t\t\t return r
				
			\t\t Networking_Cache[code] = Network_GlobalState[code]
				
			\t\t return Network_GlobalState[code]
		\t elif code in Networking_Cache:
			
			\t\t return Networking_Cache[code]
	
	def Network_SendBoth(id1, id2, data):
		\t global Networking_Enabled
		\t global Network_Sent
		\t global Network_LocalState
		\t global Network_GlobalState
		
		# Local input.
		\t if not Networking_Enabled: 
			\t\t Network_GlobalState[chr(2)+chr(Network_Me)+chr(id1)+chr(id2)] = data
			\t\t return
		
		\t if chr(id1)+chr(id2) in Network_Sent and Network_Sent[chr(id1)+chr(id2)]:
			\t\t return
		\t Network_LocalState += [id1, id2, data]
		\t Network_Sent[chr(id1)+chr(id2)] = True
	
	def Network_GetBoth(id1, id2):
		\t global Network_GlobalState
		\t global Network_NetworkEnabled
		\t code = chr(2)+chr(Network_User)+chr(id1)+chr(id2)
		\t if code in Network_GlobalState:
		
			# Local input.
			\t\t if not Networking_Enabled:
				\t\t\t r = Network_GlobalState[code]
				\t\t\t Network_GlobalState[code] = 0
				\t\t\t return r
				
			\t\t return Network_GlobalState[code]
			
		\t return -1

	def Network_SetState(state, user):
		\t i = 0
		\t while True:
			\t\t if state[i] >= 65 and state[i] <= 90:
				\t\t\t Network_GlobalState.update({chr(0)+chr(user)+chr(state[i])+chr(state[i+1])+chr(state[i+2]): True})
			\t\t elif state[i] >= 97 and state[i] <= 122:
				\t\t\t Network_GlobalState.update({chr(1)+chr(user)+chr(state[i]): [state[i+1], state[i+2]]})
			\t\t else:
				\t\t\t Network_GlobalState.update({chr(2)+chr(user)+chr(state[i])+chr(state[i+1]): state[i+2]})
			
			\t\t i += 3
			\t\t if i >= len(state):
				\t\t\t return
}
