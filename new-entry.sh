#!/bin/bash

# Get today's date components
TODAY=$(date +%F)                     # YYYY-MM-DD
DAY_NUM=$(date +%-d)                  # D (no leading zero)
LONG_DATE=$(date +"%d %B %Y")         # DD Month YYYY
FILE_NAME="_posts/${TODAY}-day-${DAY_NUM}.md"
POST_TITLE="Day ${DAY_NUM} - ${LONG_DATE}"
POST_URL="${TODAY}-day-${DAY_NUM}.html"

# Check if file already exists
if [ -f "$FILE_NAME" ]; then
  echo "❌ Entry for today already exists: $FILE_NAME"
  exit 1
fi

# Create new post
cat <<EOF > $FILE_NAME
---
title: "${POST_TITLE}"
date: ${TODAY}
---

**✅ Tasks Done:
1. Notification Add for Getting Booking
2. Middleware update for Booking
3. Test Cases for Booking
4. Booking API Integration
**
EOF

echo "✅ Created new diary entry: $FILE_NAME"

# Check if link already exists
if grep -q "${POST_URL}" "$README_FILE"; then
  echo "ℹ️ Link already exists in README.md"
else
  echo "$LINK_LINE" >> "$README_FILE"
  echo "📌 Added link to README.md"
fi

#  Git commands (optional - uncomment to automate)
 git add .
 git commit -m "Added diary entry for $LONG_DATE"
 git push origin main
