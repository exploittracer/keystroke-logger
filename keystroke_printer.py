# Imports the keyboard monitoring class
from pynput.keyboard import Listener

# On every key press, the lambda simply 
# prints the key object to the terminal. 
# No file I/O, no persistence.
with Listener(on_press=lambda key: print(key)) as listener:
    # Blocks the main thread, running the listener indefinitely.
    listener.join()