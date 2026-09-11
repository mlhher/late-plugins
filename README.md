# late-plugins

Official plugin collection and registry for [late-cli](https://github.com/mlhher/late-cli).

## Available Plugins

| Plugin | Description |
|--------|-------------|
| [notify-tool-approval](./plugins/notify-tool-approval) | Desktop notifications when tools need approval |

## Installation

No setup required.

```bash
late plugin install notify-tool-approval
```

Verify it's loaded:

```bash
late plugin list
```

## Uninstall

```bash
late plugin remove notify-tool-approval
```

## Writing Your Own Plugin

See the [late-cli Plugin SDK](https://github.com/mlhher/late-cli/blob/main/docs/plugin-sdk.md) for the full reference and [CONTRIBUTING.md](./CONTRIBUTING.md) for how to submit a plugin to this collection.

## License

MIT
