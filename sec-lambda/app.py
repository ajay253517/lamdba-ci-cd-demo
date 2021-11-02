import json

def handler(event, context):
    body = {
        "message": "Hello Running second-code",
        "input": event
    }
    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }
    return response 
