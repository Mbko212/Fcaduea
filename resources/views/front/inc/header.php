<?php include('inc/head.php')?>

<body>
    <div class="header-blue">
        <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
            <div class="container">
                <a class="navbar-brand navbar-left" href="index.php">
                    <img src="img/logo-1.png" target="_self" />
                </a>
                <button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1">
                    <span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon">
                    </span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="nav-item" role="presentation"><a class="nav-link " href="index.php">Home </a>
                        </li>
                        <li>
                            <div class="dropdown">
                                <button class="nav-link dropbtn"
                                    onclick="location.href='souvenir.php';">Souvenirs</button>
                                <div class="dropdown-content">
                                    <a href="#">Baby shower</a>
                                    <a href="#">bridal shower</a>
                                    <a href="#">henna night</a>
                                    <a href="#">Grangaoh night</a>
                                    <a href="#">graduation</a>
                                    <a href="#">wedding</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown">
                                <button class="nav-link dropbtn" onclick="location.href='gifts.php';">Gifts</button>
                                <div class="dropdown-content">
                                    <a href="#">Ramadan gifts</a>
                                    <a href="#">Eid Al fater</a>
                                    <a href="#">Eid Al adha</a>
                                    <a href="#">Mother’s Day</a>
                                    <a href="#">Breast cancer day</a>
                                    <a href="#">Sports day</a>
                                    <a href="#">National day</a>
                                </div>
                            </div>
                        </li>

                        <li class="nav-item" role="presentation"><a class="nav-link" href="candels.php">
                                candels</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">
                                Soap</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#">
                                Chocolates</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="accessories.php">
                                Accessories</a></li>
                        <li class="nav-item p-2 pl-4" role="presentation">
                            <a href="#"> <img width="18px" src="img/search-interface-symbol.png" alt=""></a>
                        </li>
                        <li class="nav-item p-2" role="presentation">
                            <a href="signin.php"> <img width="18px" src="img/user.png" alt=""></a>
                        </li>
                        <li class="nav-item p-2" role="presentation">
                            <a href="bookmark.php"> <img width="18px" src="img/ribbon.png" alt=""></a>
                        </li>
                        <li class="nav-item p-2" role="presentation">
                            <a href="productcart.php"> <img width="18px" src="img/shopping-bag.png" alt=""></a>
                        </li>
                    </ul>
                    <!-- <ul class="nav navbar-nav navbar-right">
                       
                    </ul> -->
                </div>
                <div class="canvas-icon text-right">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
            </div>
        </nav>
        <div class="mobile-header navbar-dark">
            <div class="cancel">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x"
                    viewBox="0 0 16 16">
                    <path
                        d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                </svg>
            </div>
            <ul class="mobile-nav navbar-nav">
                <li class="nav-link"><a class="text-black" href="index.php">Home</a></li>
                <li class="nav-link"><a class="text-black" href="souvenir.php">Souvenir</a></li>
                <li class="nav-link"><a class="text-black" href="gifts.php">Gifts</a></li>
                <li class="nav-link"><a class="text-black" href="candels.php">Candels</a></li>
                <li class="nav-link"><a class="text-black" href="#">Soap</a></li>
                <li class="nav-link"><a class="text-black" href="#">Chocolate</a></li>
                <li class="nav-link"><a class="text-black" href="accessories.php">Accessories</a></li>
                <li>
                    <div class="button-group mt-3">
                        <a href="signin.php"><img width="18px" src="img/user.png" alt=""></a>
                        <a href="bookmark.php" class="mx-2"><img width="18px" src="img/ribbon.png" alt=""></a>
                        <a href="productcart.php"><img width="18px" src="img/shopping-bag.png" alt=""></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>