import { Typography } from "@mui/material";
import { useEffect } from "react";
import "./App.css";
import Menu from "./menu";

const App = () => {
  useEffect(() => {});
  return (
    <div>
      {/* <Typography variant="h4" component="h4">
        Device Loan Manager
      </Typography> */}
      <Menu />
    </div>
  );
};

export default App;
