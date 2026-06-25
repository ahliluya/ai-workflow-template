import time
from datetime import datetime

QUEUE_PATH = "agent_mesh/a2a/runtime/message_queue.md"
LOG_PATH = "status/runtime_log.md"

def read_queue():
    try:
        with open(QUEUE_PATH, "r") as f:
            return f.read()
    except FileNotFoundError:
        return "EMPTY QUEUE"

def write_log(content):
    with open(LOG_PATH, "a") as f:
        f.write(content + "\n\n")

def run_cycle():
    queue = read_queue()

    log = f"""
========================
RUNTIME CYCLE
TIME: {datetime.now()}

QUEUE:
{queue}

STATUS:
Router → OK
Planner → SIMULATED
Executor → SIMULATED
Reviewer → SIMULATED
Memory → SIMULATED

RESULT:
Cycle executed (MVP runtime active)
========================
"""

    write_log(log)
    print("cycle executed")

if __name__ == "__main__":
    print("AI_WORKSPACE runtime engine starting...")

    while True:
        run_cycle()
        time.sleep(5)
