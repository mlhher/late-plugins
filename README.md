# late-plugins

Official plugin collection and registry for [late-cli](https://github.com/mlhher/late-cli).

## Available Plugins

| Plugin | Description | Install |
|--------|-------------|---------|
| [notify-tool-approval](./plugins/notify-tool-approval) | Desktop notifications when tools need approval | See below |

## Installation

Clone this repo and link the plugin you want:

```bash
git clone https://github.com/mlhher/late-plugins.git ~/.local/share/late-plugins
late plugin link ~/.local/share/late-plugins/plugins/notify-tool-approval
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
