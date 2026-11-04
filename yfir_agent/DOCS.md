# yfir agent

The app runs the [yfir](https://github.com/twish/yfir) agent on this Home
Assistant host. It enrols with your yfir hub on first start and then reports
the host's facts, metrics, journal, containers and listening services, so the
host shows in the hub's inventory, map, dashboards and rules like any other.
The agent observes the host; it never changes it.

## Installation

1. On a machine with the `yfir` CLI, run `yfir enroll --host <name>`. Its last
   block, "Or, as the Home Assistant app's options", lists the three values
   below.
2. Install this app, open its **Info** tab and turn **Protection mode** off
   (see [Grants](#grants) for why).
3. On the **Configuration** tab, paste each value into its field, or open
   ⋮ → **Edit in YAML** and paste the block as it is printed. Save.
4. Start the app. `yfir inventory` lists the host online, with packaging
   `container`.

## Options

- **`hub`**: the address the agent dials, as `host:port`: the hub's host name
  and its agent port (8421 unless the hub was configured otherwise).
- **`token`**: the one-time enrollment token. The agent uses it on the first
  start, stores its own credential in the app's `/data` and ignores the token
  from then on. It expires 24 hours after `yfir enroll` printed it.
- **`tls_fingerprint`**: pins the hub's self-signed certificate, so the agent
  trusts that certificate and no other. Leave it empty when the hub's
  certificate is issued by a public CA.

## Grants

Each grant opens one part of the host to the agent.

- **`host_network`**: the host's interfaces, subnets, listening ports and
  public address, instead of the app container's own.
- **`host_uts`**: the host's hostname, instead of the container's.
- **`host_pid`**: the processes behind the listening ports, which on Home
  Assistant OS run in other apps' containers; their `/proc` entries name the
  owner of each port.
- **`journald`**: the host journal, read-only. Home Assistant OS logs every
  container there, so the hub gets the containers' logs from it.
- **`docker_api`**: the host's Docker socket. The mount is read-only, but that
  does not limit the API behind it: the grant gives full control of the host's
  Docker engine, and with it the host. The agent only reads through it: the
  containers and their images for the inventory and the map. A `run-script` on
  this agent therefore runs with the power of root on the host, as it does on
  any host where the agent is installed as root.

`host_pid` and `docker_api` are only granted with **Protection mode** off,
which is why the installation turns it off. The app asks for no Supervisor or Home
Assistant API access and keeps the default AppArmor profile.

Filesystem metrics come from the app's own mounts, so the host's data
partition is reported as `/data`; the boot and overlay partitions are not.

## Updates

Each yfir release publishes a new version of this app. It arrives as an
ordinary app update in Home Assistant, by hand or through Home Assistant's
automatic app updates; the hub never upgrades this agent itself.

## Actions

The agent observes only. The actions that change a host (`restart-unit`,
`restart-compose-service`, `compose-pull-up`, `reboot`, `os-upgrade`) fail
with `unsupported` on this host. `run-script` and `scan` run inside the app's
container, which shares the host's network.

## When the host does not come online

Open the app's **Log** tab. The entrypoint hands the options to the agent as
`YFIR_HUB`, `YFIR_TOKEN` and `YFIR_TLS_FINGERPRINT`, and the log says which
step failed:

- `not enrolled: set YFIR_HUB and YFIR_TOKEN`: `hub` or `token` is empty.
- An enrollment error: the token was used already or has expired, the `hub`
  address is not reachable from this host, or `tls_fingerprint` does not match
  the hub's certificate. Run `yfir enroll --host <name>` again and paste the
  new values.
- `already enrolled; not using YFIR_TOKEN`: the agent has a credential in
  `/data` and ignores the token, as it should after the first start.
