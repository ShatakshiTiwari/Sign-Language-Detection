import logging
import os
from datetime import datetime
from from_root import from_root


try:
    LOG_FILE = f"{datetime.now().strftime('%m_%d_%Y_%H_%M_%S')}.log"
    log_dir = "/home/shatakshi/Downloads/End-to-end-Object-Detection-Project-main/log"
    os.makedirs(log_dir, exist_ok=True)
    LOG_FILE_PATH = os.path.join(log_dir, LOG_FILE)

    logging.basicConfig(
        filename=LOG_FILE_PATH,
        format="[ %(asctime)s ] %(name)s - %(levelname)s - %(message)s",
        level=logging.INFO
    )

except Exception as e:
    print(f"Error: {e}")

