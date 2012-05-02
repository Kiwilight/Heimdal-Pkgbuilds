ARCHITECTURE = %w(x86_64)

def make(name, list); task name, :cleanse do |t, argv|
  Dir.chdir name
  ARCHITECTURE.each do |target| list.each do |i|
    argv = [ i, target, argv[:cleanse] ]
    system "../install #{argv.join ' '}"; end; end
  Dir.chdir '..'
end; end

def define(outline); outline.each do |name, list|
  make name, list; end; end

define 'heimdal'   => %w(heimdal),
  'arch'           => %w(arch),
  'audit'          => %w(audit),
  'autofs'         => %w(autofs),
  'bind'           => %w(bind),
  'cups'           => %w(libcups),
  'cyrus-sasl'     => %w(cyrus-sasl cyrus-sasl-gssapi),
  'dnsutils'       => %w(dnsutils),
  'dovecot'        => %w(dovecot),
  'freeradius'     => %w(freeradius),
  'gsasl'          => %w(gsasl),
  'heirloom-mailx' => %w(heirloom-mailx),
  'kdelibs'        => %w(kdelibs),
  'librpcsecgss'   => %w(librpcsecgss),
  'libsasl'        => %w(libsasl),
  'mutt'           => %w(mutt),
  'neon'           => %w(neon),
  'openssh'        => %w(openssh),
  're-alpine'      => %w(re-alpine),
  'subversion'     => %w(subversion)
