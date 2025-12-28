#!/bin/bash
# Test script for the contact API endpoint

echo "Testing Contact API Endpoint"
echo "=============================="
echo ""

# Test 1: Valid request from grainstoryfarm.ca
echo "Test 1: Valid request from grainstoryfarm.ca"
echo "--------------------------------------------"
RESPONSE=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X POST https://grainstoryfarm.ca/api/contact \
  -H 'Content-Type: application/json' \
  -H 'Origin: https://grainstoryfarm.ca' \
  -H 'Referer: https://grainstoryfarm.ca/' \
  -d '{"name":"Test User","email":"test@test.com","phone":"1234567890","message":"This is a test message"}')

HTTP_CODE=$(echo "$RESPONSE" | grep "HTTP_CODE" | cut -d':' -f2)
BODY=$(echo "$RESPONSE" | sed '/HTTP_CODE/d')

echo "HTTP Status: $HTTP_CODE"
echo "Response:"
echo "$BODY" | python3 -m json.tool 2>/dev/null || echo "$BODY"
echo ""

# Test 2: Invalid request from different domain (should be blocked)
echo "Test 2: Request from different domain (should be blocked)"
echo "----------------------------------------------------------"
RESPONSE2=$(curl -s -w "\nHTTP_CODE:%{http_code}" -X POST https://grainstoryfarm.ca/api/contact \
  -H 'Content-Type: application/json' \
  -H 'Origin: https://evil.com' \
  -H 'Referer: https://evil.com/' \
  -d '{"name":"Hacker","email":"hacker@evil.com","message":"Should be blocked"}')

HTTP_CODE2=$(echo "$RESPONSE2" | grep "HTTP_CODE" | cut -d':' -f2)
BODY2=$(echo "$RESPONSE2" | sed '/HTTP_CODE/d')

echo "HTTP Status: $HTTP_CODE2"
echo "Response:"
echo "$BODY2" | python3 -m json.tool 2>/dev/null || echo "$BODY2"
echo ""

# Test 3: Health check
echo "Test 3: Health check endpoint"
echo "------------------------------"
curl -s https://grainstoryfarm.ca/api/health | python3 -m json.tool 2>/dev/null || curl -s https://grainstoryfarm.ca/api/health
echo ""

echo "=============================="
echo "Tests complete!"

