# Instructions
## Creating gem file
`rake package`

Creates a gem file in pkg/csigar-0.x.x.gem.

## Installing gem file
`gem install pkg/csigar-x.x.x.gem`

## Publishing gem file
`gem push pkg/csigar-x.x.x.gem`


# Docs

Visit the SIGAR Wiki for documentation, bugs, support, etc.:
http://sigar.hyperic.com/

2014-10-28
Patched version of hyperic/sigar by jgottschlich@cloudscale.de
- added cpu_perc_metric to ruby bindings
- fixed Rakefile to use Gem::PackageTask instead of deprecated package
- changed version number to 0.7.3


