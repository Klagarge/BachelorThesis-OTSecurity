// HEADER
#import "/00-templates/helpers.typ": *
#context {
  if bib-state.get() != true {
    bib-state.update(true)
    show bibliography: none
    bibliography("/03-tail/bibliography.bib", style:bibstyle)
  }
}
// END OF HEADER


#let body = [
  #gls("tls", long: true) is a cryptographic protocol that operates over #gls("tcp"), primarily associated with layers 5 and 6 of the OSI model #cite(<ISO-OSI_model-74981-1>). #gls("tls") is commonly considered a layer 6 protocol. Technically, it spans both layers 5 and 6. It establishes an encrypted session at layer 5 and handles the encryption itself at layer 6.

  #gls("tls") provides secure communication between two parties, typically a client and a server. The process begins with a handshake, as illustrated in @fig:tls-handshake, where the client and server exchange a series of messages to establish a secure connection. This handshake involves the exchange of random numbers, a certificate, and a seed. The #gls("d-h") key exchange is used to generate a master key, a symmetric key that will be used to encrypt all communications within that session.

  During the handshake, the client, and server also exchange #gls("x509") certificates to verify each other's identity. An #gls("x509") certificate contains information about the certificate's owner, such as their name and expiration date. For server certificates, it also includes the server's IP address or domain name used for #gls("tls") communication. The certificate also includes the owner's public key, which is used to authenticate their message later on. #gls("x509") certificates rely on a chain of trust provided by #glspl("ca"). A #gls("ca") is a trusted third party that verifies the identity of the certificate's owner and signs the certificate to validate it. The client and server can then verify the validity of each other's certificates by checking the #gls("ca", long: false)'s signature. If the signature is valid, the certificate is considered trustworthy, forming the basis of the TLS handshake.
]

#import "/04-resources/chronos-drawings.typ": *
#let tls = {
  import chronos: *
  controller()
  simulation()
  
  async(c, s, "client random")
  async(s, c, "server random")
  async(s, c, "certificate")
  async(c, c, "verify certificate")
  async(c, s, "certificate")
  async(s, s, "verify\ncertificate", flip: true)
  async(c, s, "encrypted seed (pre-master)")
  async(s, s, "decrypted\nseed", flip: true)
  _sync({
    async(c, c, "create\nmaster key")
    async(s, s, "create\nmaster key", flip: true)
  })
}

#let fig = [
  #figure(
    align(center,
      chronos.diagram(tls, width: 5.5cm)
    ),
    caption: [TLS handshake],
  ) <fig:tls-handshake>
]

#wrap-content(
  fig,
  body,
  align: top + right,
)

// #table(
//   columns: (1.5fr, 1fr),
//   align: left + top,
//   stroke: none,
//   //inset: 1em,
//   body,
//   fig,
// )