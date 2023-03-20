export interface AgentSubscription {
  agentName: string;
  subscriptionNumber: number;
}

export type Ship = `~${ string }`
export type GroupName = string // hepped
export type Flag = `${ Ship }/${ GroupName }`
export type When = number;     // unix seconds

export type ResourceType = 'chat' | 'heap' | 'diary'
