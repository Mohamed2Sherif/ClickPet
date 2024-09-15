import { GenderType, Gender } from "../consts/PetGenderCosnt";
export interface User {
  _id: string;
  firstName: string;
  lastName: string;
  userName: string;
  email: string;
  phoneNumber: string;
  emailConfirmed: boolean;
  authenticityConfirmed: boolean;
  roles: { roleName: string }[];
}

export interface PetOwner {
  _id: string;
  name: string;
  phoneNumber: string;
  pets: string[];
}
export interface Pet {
  _id: string;
  petName: string;
  petAge: string;
  petGender: GenderType;
  favouriteDryFood: string;
  favouriteSandType: string;
  weight: Float32Array;
  petTypeProperties; // ask the business first whether it changes alot or relatively constant across multiple objects
}

export interface Visit {
  _id: string;
  ownerId: string;
  petId: string;
  doctorId: string;
  VisitDate: number;
  problem: string;
  vaccination: {
    vaccinationId: string;
  }[];
  notes: string;
  scheduled: boolean;
}

export interface Vaccination {
  _id: string;
  vaccinationNamae: string;
  petType: {
    _id: string;
  }[];
}
export interface PetType {
  _id: string;
  Name: string;
}
