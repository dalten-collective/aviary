export interface AgentSubscription {
  agentName: string;
  subscriptionNumber: number;
}


export type Ship = `~${ string }`
export type GroupName = string // hepped
export type Flag = `${ Ship }/${ GroupName }`
export type When = number;     // unix seconds

export interface Thing {
  key: 'value'
}

export type GallResponse = ExampleResponseOne | ExampleResponseTwo

export interface ExampleResponseOne {
  test: {
    thing: 'one'
  }
}
export interface ExampleResponseTwo {
  testTwo: {
    thing: 'two'
  }
}

export const IsResponseOne = (r: GallResponse):
  r is ExampleResponseOne => {
  return ('test' in r)
}
