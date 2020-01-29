import json

def lambda_handler(event, context):
    body = {}
    body["event"] = event
    return {
        "isBase64Encoded": False,
        'statusCode': 200,
        'headers': {"Contents-Type": "application/json"},
        'body': json.dumps(body)
    }
