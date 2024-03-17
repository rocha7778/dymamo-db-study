aws dynamodb query \
   --table-name Orders \
   --index-name LSI_OrderDate \
   --key-condition-expression 'Customer = :cust AND OrderDate BETWEEN :orderDate1 AND :orderDate2' \
   --expression-attribute-values '{
      ":cust": {"S": "101"}
   }' \
   --endpoint-url   http://localhost:8000


   aws dynamodb create-table \
    --table-name  Customer \
    --attribute-definitions \
       AttributeName=customer_number,AttributeType=S \
    --key-schema \
       AttributeName=customer_number,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --endpoint-url   http://localhost:8000


aws dynamodb put-item \
    --table-name Customer \
    --item '{
        "customer_number": {"S": "CUST#102"},
        "fname": {"S": "jane"},
        "lname": {"S": "doe"},
        "phone": {"S": "555-555-5566"}
    }' \
    --return-consumed-capacity TOTAL \
    --endpoint-url http://localhost:8000


aws dynamodb put-item \
    --table-name Customer \
    --item '{
        "customer_number": {"S": "CUST#101"},
        "fname": {"S": "john"},
        "lname": {"S": "doe"},
        "phone": {"S": "555-555-5555"}
    }' \
    --return-consumed-capacity TOTAL \
    --endpoint-url http://localhost:8000
