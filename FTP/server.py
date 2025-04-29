import socket

SERVER_HOST = '0.0.0.0'
SERVER_PORT = 5001

s = socket.socket()
s.bind((SERVER_HOST, SERVER_PORT))
s.listen(1)
print(f"[*] Listening on {SERVER_HOST}:{SERVER_PORT}")

client_socket, client_address = s.accept()
print(f"[+] {client_address} is connected.")

# Receive fixed-length headers
filename = client_socket.recv(128).decode().strip()
filesize = int(client_socket.recv(16).decode().strip())
print(f"[+] Receiving {filename} ({filesize} bytes)")

with open(filename, "wb") as f:
    bytes_read = 0
    while bytes_read < filesize:
        chunk = client_socket.recv(4096)
        if not chunk:
            break
        f.write(chunk)
        bytes_read += len(chunk)

print(f"[+] File {filename} received successfully.")
client_socket.close()
s.close()

