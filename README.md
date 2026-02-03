# smithy-event-traits

Smithy Event traits and CloudEvents envelope definitions.

## Quality

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=sqale_index)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=coverage)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=bugs)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=maze-technology_smithy-event-traits&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=maze-technology_smithy-event-traits)

## Smithy Models

This library provides:

- `tech.maze.events#CloudEvent` (CloudEvents v1.0 envelope)
- `tech.maze.events#event` trait for event payload structures
- `source` is optional in the trait and is typically set by the emitter at runtime.

Example usage:

```smithy
$version: "2"

namespace example.notifications

use tech.maze.events#event

@event(
  type: "example.notification.created",
  topic: "notifications.created",
  version: "1.0.0"
)
structure NotificationCreated {
  @required
  id: String
}
```

## Development

### Requirements

- JDK 21

### Build

```bash
./gradlew build
```

### Publish (GitHub Packages)

Set the following environment variables:

- `GITHUB_USERNAME` (use `x-access-token` in CI)
- `GITHUB_TOKEN` (PAT with `read:packages` + `write:packages`)
- `GITHUB_REPOSITORY` (e.g. `maze-technology/smithy-event-traits`)

Then publish:

```bash
./gradlew publish
```

To publish a tagged version:

```bash
./gradlew -Pversion=0.0.1 publish
```

## Smithy Build Flow (Consumers)

This project publishes Smithy models under `META-INF/smithy`. Consumers should resolve it via Smithy CLI:

```json
{
  "version": "1.0",
  "sources": ["src/main/smithy"],
  "maven": {
    "dependencies": [
      "tech.maze:smithy-event-traits:0.0.1"
    ]
  }
}
```

If the dependency is hosted on GitHub Packages, set:

- `GITHUB_USERNAME`
- `GITHUB_TOKEN`

Then run:

```bash
smithy build
```
