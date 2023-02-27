use aws_config::meta::region::RegionProviderChain;
use aws_sdk_dynamodb::Client;
use aws_sdk_dynamodb::model::AttributeValue;
use lambda_runtime::{service_fn, LambdaEvent, Error};
use serde::Deserialize;
use serde_json::{json, Value};
use uuid::Uuid;

#[tokio::main]
async fn main() -> Result<(), Error> {
    let func = service_fn(func);
    lambda_runtime::run(func).await?;
    Ok(())
}

//#[derive(Deserialize)]
// struct CustomEvent {
//     first_name: String,
//     last_name: String
// }

async fn func(event: LambdaEvent<Value>) -> Result<Value, Error> {
    let (event, _context) = event.into_parts();
    let first_name = event["first_name"].as_str().unwrap_or("no_first_name");
    let last_name = event["last_name"].as_str().unwrap_or("no_last_name");
    let uuid = Uuid::new_v4().to_string();

    let region_provider = RegionProviderChain::default_provider()
        .or_else("ap-south-1");
    let config = aws_config::from_env().region(region_provider).load().await;
    let client = Client::new(&config);

    let request = client.put_item()
        .table_name("users")
        .item("uid", AttributeValue::S(String::from(uuid)))
        .item("first_name", AttributeValue::S(String::from(first_name)))
        .item("last_name", AttributeValue::S(String::from(last_name)));

    request.send().await?;

    Ok(json!({ "message": "Record written!" }))
}