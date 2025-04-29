import socket
import os

SERVER_HOST = ''  # Replace with server IP
SERVER_PORT = 5001
filename = "example.txt"       # File to send

filesize = os.path.getsize(filename)

s = socket.socket()
s.connect((SERVER_HOST, SERVER_PORT))
print(f"[+] Connected to {SERVER_HOST}:{SERVER_PORT}")

# Send header: 128 bytes for filename, 16 bytes for filesize
s.send(f"{filename:<128}".encode())  # pad filename
s.send(f"{filesize:<16}".encode())   # pad filesize

# Send file content
with open(filename, "rb") as f:
    while True:
        bytes_read = f.read(4096)
        if not bytes_read:
            break
        s.sendall(bytes_read)

print(f"[+] File {filename} sent successfully.")
s.close()

