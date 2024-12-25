use axum::{
    routing::get,
    Router,
    http::StatusCode,
    Json,
};
use std::net::SocketAddr;
use tower_http::trace::TraceLayer;
use tokio::net::TcpListener;

#[derive(serde::Serialize)]
struct HealthResponse {
    status: String,
}

async fn health_check() -> (StatusCode, Json<HealthResponse>) {
    (
        StatusCode::OK,
        Json(HealthResponse {
            status: "healthy".to_string(),
        }),
    )
}

#[tokio::main]
async fn main() {
    // Initialize tracing
    tracing_subscriber::fmt::init();

    // Build our application with a route
    let app = Router::new()
        .route("/health", get(health_check))
        .layer(TraceLayer::new_for_http());

    // Run it
    let addr = SocketAddr::from(([0, 0, 0, 0], 3000));
    tracing::info!("listening on {}", addr);
    
    let listener = TcpListener::bind(addr).await.unwrap();
    axum::serve(listener, app).await.unwrap();
} 