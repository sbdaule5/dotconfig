#!/usr/bin/python3

# hyprctl -j -r activeworkspace | jq '.windows'
import json
import os
import socket
import subprocess


# Also do this using sockets
def run_command(command):
    process = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    output, error = process.communicate()
    if error is not None:
        print("Error:", error.decode())
        return
    result = json.loads(output.decode())
    return result


socket_file = os.path.join(
    "/tmp/hypr/", os.getenv("HYPRLAND_INSTANCE_SIGNATURE", ""), ".socket2.sock"
)
# print(socket_file)
sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
sock.connect(socket_file)

# initialize the values
result = run_command("hyprctl -j -r activeworkspace | jq '.windows'")
print(f"{json.dumps(result, indent=2)}", flush=True)

try:
    # print(f"Connected to socket at {socket_file}")
    while True:
        data = sock.recv(10000)
        if not data:
            break
        data = data.decode()
        if (
            data.find("openwindow>>") != -1
            or data.find("workspace>>") != -1
            or data.find("workspacev2>>") != -1
            or data.find("closewindow>>") != -1
        ):
            result = run_command("hyprctl -j -r activeworkspace | jq '.windows'")
            print(f"{json.dumps(result, indent=2)}", flush=True)
            # f = open("/tmp/tp.log", "w")
            # f.write(json.dumps(result, indent=2))
            # f.close()
finally:
    sock.close()
