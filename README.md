# Consul

Generate token with command:

```/bin/bash
uuidgen
```

create aCL:

````json
{"node": {
    "": {
      "policy": "write"
    }
  },
  "service": {
     "": {
      "policy": "write"
    }
  },
  "agent": {
    "": {
      "policy": "write"
    }

  },
  "session": {
    "": {
      "policy": "write"
    }
  }}
  ```
