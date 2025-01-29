export const Gender = {
    Female: 'F',
    Male: 'M'
} as const;

export type GenderType = typeof Gender[keyof typeof Gender];
