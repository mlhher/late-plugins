# Contributing a Plugin

We welcome plugin contributions! Here's how to add yours to the official collection.

## Requirements

1. Your plugin must have a valid `package.json` with a `"late"` field.
2. It must do something genuinely useful — not a toy demo.
3. All scripts must be executable (`chmod +x`).
4. Include a brief description in your `package.json`.

## Steps

1. Fork this repository.
2. Create your plugin directory under `plugins/your-plugin-name/`.
3. Add a registry entry at `registry/plugins/your-plugin-name.json`:
   ```json
   {
     "git": "github:mlhher/late-plugins",
     "description": "Short description of what your plugin does"
   }
   ```
4. Add your plugin to the table in `README.md`.
5. Open a pull request.

## Plugin structure

```
plugins/your-plugin/
├── package.json          # must contain "late" field
└── scripts/              # hook/tool/command scripts
    └── ...
```

See the [Plugin SDK](https://github.com/mlhher/late-cli/blob/main/docs/plugin-sdk.md) for all available surfaces (hooks, commands, themes, tools, MCP servers, skills).
