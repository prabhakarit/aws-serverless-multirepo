package main

import (
	"fmt"

	"https://github.com/aws/aws-lambda-go/lambda"
	"https://github.com/aws/aws-lambda-go/tree/main/lambda"
)

func Handler(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	fmt.Println("Received body: ", request.Body)

	return events.APIGatewayProxyResponse{Body: request.Body, StatusCode: 200}, nil
}

func main() {
	lambda.Start(Handler)
}
