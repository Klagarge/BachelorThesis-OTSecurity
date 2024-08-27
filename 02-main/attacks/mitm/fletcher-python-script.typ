#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#import fletcher.shapes: diamond
#set text(font: "Comic Neue", weight: 600)

#diagram(
  node-stroke: 1pt,
  edge-stroke: 1pt,
  let (start, tcp, length, dport, sport, func-code, accept) = ((0,0), (0,1), (0,3), (0,5), (1,6), (0,8), (0,11)),
  node(start, [Start], corner-radius: 2pt, extrude: (0, 3)),

  edge("-|>"),
  node(tcp, align(center)[
    Is TCP \ packet ?
  ], shape: diamond),
  edge("-|>", [Yes], label-pos: 0.1),
  node((0,2), [Get payload]),
  edge("-|>"),
  node(length, align(center)[
    check length
  ], shape: diamond),
  edge("-|>", [>= 8], label-pos: 0.1),
  node((0,4), [get function code \ (payload[7])]),
  edge("-|>"),

  /************************
   * Controller to Server *
   ************************/
  node(dport, align(center)[
    check dest \ port
  ], shape: diamond),
  edge("-|>", [1502], label-pos: 0.1),
  node((0,6), [get unit id]),
  edge("-|>", (0,7)),
  node((0.5,7), [get transaction ID (payload[0:2])]),
  edge((0,7),"-|>", (0,8)),
  node(func-code, align(center)[
    check \ func. code
  ], shape: diamond),
  edge("-|>", [Yes], label-pos: 0.1),
  node((0,9), [Address = payload[2:4]]),


  /************************
   * Server to Controller *
   ************************/
  node(sport, align(center)[
    check src \ port
  ], shape: diamond),
  edge(dport,"r", sport, "-|>", [other], label-pos: 0.1),
  edge("-|>",(1,7), [1502], label-pos: 0.1),
  //node((0.5,7), [Transaction ID = payload[0:2]]),


  edge(tcp, "ll,dddddddddd,rr", "-|>", [No], label-pos: 0.1),
  edge(length, "ll,dddddddd,rr", "-|>", [< 8], label-pos: 0.1),
  edge(sport, "r,ddddd,ll", "-|>", [other], label-pos: 0.1),
  node(accept, [Accept packet], corner-radius: 2pt),
)