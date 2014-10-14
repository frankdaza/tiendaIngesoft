<?php

session_start();
session_destroy();

// Redirecciono al login del sistema
header("Location: ../../site/login.php");