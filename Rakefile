ARCHITECTURE = %w(x86_64)

def make(name); task name[0], :cleanse do |t, argv|
  Dir.chdir name[0]
  ARCHITECTURE.each do |target| name.each do |i|
    argv = [ i, target, argv[:cleanse] ]
    system "../install #{argv.join ' '}"; end; end
  Dir.chdir '..'
end; end

[ %w(heimdal), %w(cyrus-sasl cyrus-sasl-gssapi),
  %w(dnsutils), %w(gsasl), %w(heirloom-mailx),
  %w(kdelibs), %w(libsasl), %w(neon), %w(re-alpine),
  %w(subversion) ].each do |package|
  make package
end
