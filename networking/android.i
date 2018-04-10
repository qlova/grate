 //Python Lockstep Implementation.
.android {
	static Hashtable<String, Boolean> 		Network_Sent = new Hashtable<String, Boolean>();
	static Stack.Array 						Network_LocalState = new Stack.Array();
	static Hashtable<String, Stack.Array>	Network_GlobalState = new Hashtable<String, Stack.Array>();
	static boolean 							Networking_Enabled = false;
	static byte 							Network_User = 1;
	static byte								Network_Me = 1;
	
	static ArrayBlockingQueue<Stack.Array> 	Network_Queue = new ArrayBlockingQueue<Stack.Array>(10);

	static void Network_SendCode(byte id, byte data1, byte data2) {
		String code = new String(new byte[]{0, Network_Me, id, data1, data2});
		
		if (!Networking_Enabled) {
			Network_GlobalState.put(code, new Stack.Array());
			return;
		}
		
		Boolean sent = Network_Sent.get(code);
		if (sent != null && sent) {
			return;
		}
		
		Network_LocalState = Network_LocalState.join(new Stack.Array(new Stack.Number(id), new Stack.Number(data1), new Stack.Number(data2)));
		Network_Sent.put(code, true);
	}
	
	static boolean Network_GetCode(byte id, byte data1, byte data2) {
		String code = new String(new byte[]{0, Network_User, id, data1, data2});
		
		Stack.Array state = Network_GlobalState.get(code);
		if (state != null) {
			if (!Networking_Enabled) {
				Network_GlobalState.put(code, state);
			}
			
			return true;
		}
		
		return false;
	}
	
	static void Network_SendSets(byte id, byte data1, byte data2) {
		String code = new String(new byte[]{1, Network_Me, id});
		
		if (!Networking_Enabled) {
			Network_GlobalState.put(code, new Stack.Array(new Stack.Number(data1), new Stack.Number(data2)));
			return;
		}
		
		Boolean sent = Network_Sent.get(code);
		if (sent != null && sent) {
			return;
		}
		
		Network_LocalState = Network_LocalState.join(new Stack.Array(new Stack.Number(id), new Stack.Number(data1), new Stack.Number(data2)));
		Network_Sent.put(code, true);
	}
	
	static Stack.Array Network_GetSets(byte id) {
		String code = new String(new byte[]{1, Network_User, id});
		
		Stack.Array state = Network_GlobalState.get(code);
		if (state != null) {
			if (!Networking_Enabled) {
				Network_GlobalState.put(code, new Stack.Array(new Stack.Number(0), new Stack.Number(0)));
			}
			
			return state;
		}
		
		return null;
	}
	
	static void Network_SendBoth(byte id, byte id2, byte data1) {
		String code = new String(new byte[]{2, Network_Me, id, id2});
		
		if (!Networking_Enabled) {
			Network_GlobalState.put(code, new Stack.Array(new Stack.Number(data1)));
			return;
		}
		
		Boolean sent = Network_Sent.get(code);
		if (sent != null && sent) {
			return;
		}
		
		Network_LocalState = Network_LocalState.join(new Stack.Array(new Stack.Number(id), new Stack.Number(id2), new Stack.Number(data1)));
		Network_Sent.put(code, true);
	}
	
	static Stack.Number Network_GetBoth(byte id, byte id2) {
		String code = new String(new byte[]{2, Network_User, id, id2});
		
		Stack.Array state = Network_GlobalState.get(code);
		if (state != null) {
			if (!Networking_Enabled) {
				Network_GlobalState.put(code, new Stack.Array(new Stack.Number(0)));
			}
			
			return state.index(new Stack.Number(0));
		}
		
		return new Stack.Number(-1);
	}
	
	static void Network_SetState(Stack.Array state, Stack.Number USER) {
		byte user = ((byte)(USER.intValue()));
		
		int i = 0;
		while (true) {
			byte a = ((byte)(state.index(i)));
			byte b = ((byte)(state.index(i+1)));
			byte c = ((byte)(state.index(i+2)));
		
			if (a >= 65 && a <= 90) {
				Network_GlobalState.put(new String(new byte[]{0, user, a, b, c}), new Stack.Array());
			} else if (a >= 97 && a <= 122) {

				Network_GlobalState.put(new String(new byte[]{1, user, a}), new Stack.Array(new Stack.Number(state.index(i+1)), new Stack.Number(state.index(i+2))));
			} else {
				Network_GlobalState.put(new String(new byte[]{2, user, a, b}), new Stack.Array(new Stack.Number(state.index(i+2))));
			}
			
			i += 3;
			if (i >= state.List.size()) {
				return;
			}
		}
	}	
}
 
