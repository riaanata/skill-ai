---
name: api-reverse-engineering
description: Reverse engineer undocumented mobile and web APIs from cURL/HAR captures, analyze auth flows (JWT/HMAC/tokens), and construct type-safe client wrappers.
---

# API Reverse Engineering & Client Construction

## 1. Capture & Traffic Analysis
- Obtain raw traffic via Browser DevTools Network tab (Export HAR) or MITM proxy captures (cURL commands).
- Identify core parameters:
  - Base URL and routing patterns.
  - Required headers (e.g. `Authorization`, `X-App-Version`, `X-Platform`, `X-Signature`, `Cookie`).
  - Request payload structure (JSON vs form-urlencoded vs Protobuf/gRPC).

## 2. Authentication & Session Flow Reconstruction
- Trace the token acquisition handshake:
  - Where is the bearer/session token initially granted? (e.g. `/auth/login`, `/token/refresh`, or guest session exchange).
  - Check for dynamic signatures/HMAC hashes (inspect JavaScript bundles for signing algorithms or shared salts).
- Implement automated token refresh logic in the client wrapper so requests do not break when access tokens expire.

## 3. Constructing the Client SDK / Service Wrapper
- Encapsulate the raw HTTP calls inside an idiomatic, typed class (TypeScript or Python).
- Include standard resilience features:
  - Automatic retries with exponential backoff on transient errors (500, 502, 503, 504).
  - Explicit rate limiting to match the target API's threshold.
  - Logging of response status codes and elapsed time (without logging auth tokens or credentials).

## 4. Response Normalization & Schema Contracts
- Parse the API's raw nested JSON into clean, typed domain models.
- Handle schema evolution: Treat non-essential fields as optional to avoid breaking when the upstream provider changes undocumented keys.
