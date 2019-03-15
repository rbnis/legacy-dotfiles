#!/usr/bin/python

import os
import imaplib
import mailsecrets

def getunread(username, password, server):
    # Login to INBOX
    imap = imaplib.IMAP4_SSL(server, 993)
    imap.login(username, password)
    imap.select('INBOX')
    # Use search(), not status()
    status, response = imap.uid('search', None, 'UNSEEN')
    if status == 'OK':
        unread_msg_nums = response[0].split()
    else:
        unread_msg_nums = []

    if len(unread_msg_nums) > 0:
        print(len(unread_msg_nums))

ping = os.system("ping " + mailsecrets.server + " -c1 > /dev/null 2>&1")
if ping == 0:
    getunread(mailsecrets.username, mailsecrets.password, mailsecrets.server)
else:
    exit(1)
