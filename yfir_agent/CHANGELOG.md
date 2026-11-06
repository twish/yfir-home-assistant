# Changelog

## v0.8.0 (2026-11-06)

## What's Changed
* feat: a selected application traces its host on the map, and the tab's bars get straight inner edges (#190) by @twish in https://github.com/twish/yfir/pull/191
* feat: cpu_high and memory_high rules name the top processes (#186) by @twish in https://github.com/twish/yfir/pull/192
* fix: the host trace closes round the tab like a speech bubble (#193) by @twish in https://github.com/twish/yfir/pull/194
* feat: the host card shows the host's primary address under its name by @twish in https://github.com/twish/yfir/pull/196
* feat: top_processes emits only names above 1 % of the host's CPU or memory by @twish in https://github.com/twish/yfir/pull/199
* fix: a macOS zombie counts as exited instead of an unreadable process by @twish in https://github.com/twish/yfir/pull/200
* release: v0.8.0 by @twish in https://github.com/twish/yfir/pull/201


**Full Changelog**: https://github.com/twish/yfir/compare/v0.7.0...v0.8.0

## v0.7.0 (2026-11-05)

## What's Changed
* feat: a host card on the map carries a tab with its CPU and RAM load (#181) by @twish in https://github.com/twish/yfir/pull/183
* feat: a selected application colours its share of its host's CPU and RAM bars (#184) by @twish in https://github.com/twish/yfir/pull/187
* feat: the agent reports each host's top five processes by CPU and by memory (#185) by @twish in https://github.com/twish/yfir/pull/188
* release: v0.7.0 by @twish in https://github.com/twish/yfir/pull/189


**Full Changelog**: https://github.com/twish/yfir/compare/v0.6.0...v0.7.0

## v0.6.0 (2026-11-04)

## What's Changed
* fix: a hub restart no longer strands agents on the old version by @twish in https://github.com/twish/yfir/pull/154
* feat: a subnet only one site's hosts link to is drawn inside that site's frame by @twish in https://github.com/twish/yfir/pull/157
* docs: specify the agent as a Home Assistant app (SPEC §14, A61–A69) by @twish in https://github.com/twish/yfir/pull/164
* feat: yfir-agent run enrols itself from the environment (#158) by @twish in https://github.com/twish/yfir/pull/165
* feat: agent reports its packaging in Hello; the hub stores and shows it (#159) by @twish in https://github.com/twish/yfir/pull/166
* feat: a container-packaged agent is never upgraded in place and never changes its host (#160) by @twish in https://github.com/twish/yfir/pull/167
* feat: agent image ghcr.io/twish/yfir-agent, its test, and its place in the release (#161) by @twish in https://github.com/twish/yfir/pull/168
* docs: record the Home Assistant spike findings (A70) (#162) by @twish in https://github.com/twish/yfir/pull/170
* feat: the container agent reads the host journal by directory and its own mount table (#169) by @twish in https://github.com/twish/yfir/pull/171
* feat: the Home Assistant app folder, its release mirror, and the operator flow (#163) by @twish in https://github.com/twish/yfir/pull/173
* fix: a journald entry carrying CONTAINER_NAME is named after the container (#174) by @twish in https://github.com/twish/yfir/pull/178
* ci: the pull request's checks gate develop; a push to develop only publishes (#172) by @twish in https://github.com/twish/yfir/pull/176
* feat: the Home Assistant app no longer asks for SYS_PTRACE (#175) by @twish in https://github.com/twish/yfir/pull/177
* release: v0.6.0 by @twish in https://github.com/twish/yfir/pull/179


**Full Changelog**: https://github.com/twish/yfir/compare/v0.5.1...v0.6.0
