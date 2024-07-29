import express from 'express';
import dotenv from 'dotenv';
import mongoose from "mongoose";

dotenv.config();
const app = express();


app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(express.static('public'));

app.get('/', (req, res) => {
    return res.json({message: 'Hello World!'});
})


app.listen(process.env.PORT, async () => {
    try {
        await mongoose.connect(process.env.MONGODB_URI)
        console.log(`Listening on port ${process.env.PORT} `);
    } catch (e) {

    }
})