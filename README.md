# Secure time capsule
Send a rich private message through time to someone.

## Problem
Sending a private message through time to someone (your family, future self or posterity) when you have possibility to pass them a password.

## Solution
This repo is a couple of scripts that simplifies the following steps:
- Compress and encrypt (AES-256) any files that we want to send through time
- Add the encrypted result to any public website as a plain text (base64) along with decryption instructions (without the key)
- Submit the page to Internet Archive to preserve the message

Results demo: https://easyitblog.info/family/

## Usage

### Seal the capsule
`seal_capsule.sh <file ...>`

It'll prompt for the password (key). Print the password or write it down.

The result might look like this:
```
============================================

To decrypt the message you'll need to install the following software installed (search online how to do this): 7zip (7zz executable) and base64.
Run the following command using command line (or use GUI to same effect), this will decrypt the files and print their names. Use the SECRET password I shared with you.

echo "" | base64 -d -o secret_archive.7z && 7zz x secret_archive.7z && rm secret_archive.7z
If the tooling changed drastically, you'll need to:
 - base64 decode the quoted part of the above command (without quotes) to get the binary archive file
 - use 7zip to decode and decompress the binary archive file using the SECRET password

Powered by https://github.com/IvanVas/secure-time-capsule

============================================
```

### Upload to Web

The result of previous step is a plain text encrypted message along with decoding instructions. Both should be placed in WWW, preferably a site under your control.
E.g.: https://easyitblog.info/family/

### Save to Internet Archive (Wayback Machine)
`./submit_to_wayback.sh <url>`

Example output:
```
============================================
https://easyitblog.info/family/ has been submitted to Internet Archive
out.html file contains the result of the operation (for debugging)
Make sure the snapshot has been created within a few minutes:
https://web.archive.org/web/*/https://easyitblog.info/family/
============================================
```

### [offline] Pass the password
The noted password should be privately and durably passed to the intended recipients. A safe might do the job if stored for family.
Pass the encrypted message address (direct and Internet Archive) along with the password.

### Test the solution periodically
Set up a reminder to check the solution, especially the [Assumptions](#Assumptions).

## Solution details

The problem can be decomposed into parts.

### Privacy
Strong symmetric encryption can be applied to the messages. Thus, only the key needs to be passed secretly and conveniently. 
A message itself can be arbitrary long and changed with time.

### Durability
It's said that "what goes on the Internet, stays on the Internet". Thus, the encrypted message should to be publicly accessible in WWW. 
Additionally, we submit it to Internet Archive which operates from 1996 preserving WWW. There is a high chance it will still be there in 20 years.


## Assumptions
- The tooling will still be there in the future. Given that only open source tools are used, there's a good chance.
- The password is passed securely and durably to the intended recipient
