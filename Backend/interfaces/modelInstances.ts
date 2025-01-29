import { User} from "./models";
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

