import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ItemsTable')

#def create_item(event, context):
#    body = json.loads(event['body'])
#    table.put_item(Item={'ID': body['ID'], 'Name': body['Name']})
#    return {
#        'statusCode': 201,
#        'body': json.dumps({'message': 'Item created'})
#    }

def create_item(event, context):
    try:
        body = json.loads(event.get('body', '{}'))
        item_id = body.get('ID')
        item_name = body.get('Name')

        # Put the item into the DynamoDB table
        response = table.put_item(
            Item={
                'ID': item_id,
                'Name': item_name
            }
        )

        # Return a successful response
        return {
            'statusCode': 200,
            'body': json.dumps('Item created successfully!')
        }

    except Exception as e:
        # Log the exception
        print(e)

        # Return an error response
        return {
            'statusCode': 500,
            'body': json.dumps('Internal server error')
        }


def get_item(event, context):
    item_id = event['pathParameters']['id']
    response = table.get_item(Key={'ID': item_id})
    item = response.get('Item')
    if item:
        return {'statusCode': 200, 'body': json.dumps(item)}
    else:
        return {'statusCode': 404, 'body': json.dumps({'message': 'Item not found'})}

def update_item(event, context):
    item_id = event['pathParameters']['id']
    body = json.loads(event['body'])
    response = table.update_item(
        Key={'ID': item_id},
        UpdateExpression="set #name = :name",
        ExpressionAttributeNames={'#name': 'Name'},
        ExpressionAttributeValues={':name': body['Name']},
        ReturnValues="UPDATED_NEW"
    )
    return {'statusCode': 200, 'body': json.dumps(response['Attributes'])}

def delete_item(event, context):
    item_id = event['pathParameters']['id']
    table.delete_item(Key={'ID': item_id})
    return {'statusCode': 200, 'body': json.dumps({'message': 'Item deleted'})}

