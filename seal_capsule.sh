#!/bin/bash

7zz a -p -bd -mhe=on -mx9 archive.7z "$@"
echo
echo "Make a hard copy of the password, secure it and pass to the intended recipient."
echo "Copy paste the below message to your site."
echo
echo ============================================
echo
echo "To decrypt the message you'll need to install the following software installed (search online how to do this): 7zip (7zz executable) and base64."
echo "Run the following command using command line (or use GUI to same effect), this will decrypt the files and print their names. Use the SECRET password I shared with you."
echo
ENCR=$(base64 -i archive.7z)
echo  "echo \"${ENCR}\" | base64 -d -o secret_archive.7z && 7zz x secret_archive.7z && rm secret_archive.7z"
echo "If the tooling changed drastically, you'll need to:"
echo " - base64 decode the quoted part of the above command (without quotes) to get the binary archive file"
echo " - use 7zip to decode and decompress the binary archive file using the SECRET password"
echo 
echo "Powered by https://github.com/IvanVas/secure-time-capsule"
echo
echo ============================================
rm archive.7z
