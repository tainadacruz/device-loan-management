import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Link from "@mui/material/Link";

import Insertion from "./pages/insertion";
import Deletion from "./pages/deletion";
import Transactions from "./pages/transactions";
import Require from "./pages/require";
import Returned from "./pages/returned";

const Menu = () => {
  return (
    <div
      style={{
        background: "white",
        justifyContent: "center",
        paddingTop: "1rem",
        fontSize: "1.5rem",
        fontWeight: "bold",
      }}
    >
      <Router>
        <div className="App">
          <div
            style={{
              margin: "1rem",
            }}
          >
            <Link
              underline="none"
              style={{
                color: "black",
              }}
              href="/"
            >
              Transactions{" | "}
            </Link>
            <Link
              underline="none"
              style={{
                color: "black",
              }}
              href="/insert"
            >
              Insert{" | "}
            </Link>
            <Link
              underline="none"
              style={{
                color: "black",
              }}
              href="/delete"
            >
              Delete{" | "}
            </Link>
            <Link
              underline="none"
              style={{
                color: "black",
              }}
              href="/require"
            >
              Require{" | "}
            </Link>
            <Link
              underline="none"
              style={{
                color: "black",
              }}
              href="/return"
            >
              Return{" "}
            </Link>
          </div>

          <Switch>
            <Route path="/" exact component={Transactions} />
            <Route path="/insert" component={Insertion} />
            <Route path="/delete" component={Deletion} />
            <Route path="/require" component={Require} />
            <Route path="/return" component={Returned} />
          </Switch>
        </div>
      </Router>
    </div>
  );
};

export default Menu;
