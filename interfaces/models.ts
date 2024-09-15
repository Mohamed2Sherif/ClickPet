export interface User {
    _id:string,
    firstName:string,
    lastName:string,
    userName:string,
    email:string,
    phoneNumber:string,
    emailConfirmed:boolean,
    authenticityConfirmed:boolean,
    roles:{roleName:string}[]
}
const user: User = {
    _id: "abc123",
    firstName: "John",
    lastName: "Doe",
    userName: "johndoe",
    email: "john@example.com",
    phoneNumber: "123-456-7890",
    emailConfirmed: true,
    authenticityConfirmed: true,
    roles: [
        { roleName: "Admin" },
        { roleName: "Doctor" }
    ]
};
