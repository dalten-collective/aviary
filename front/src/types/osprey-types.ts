import * as T from '@/types'

export interface Schedule {
  next: number; // hoon seconds
  last: number; // hoon seconds
  area: {
    flag: T.Flag;
    type: string; // like "GROUP"
  };
}

export interface MailSlot {
  data: string; // 'NONE'
  group: T.Flag;
}
