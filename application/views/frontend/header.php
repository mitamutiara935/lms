<header id="home">

<!-- Start Navigation -->
<nav class="navbar navbar-default logo-less small-pad navbar-sticky bootsnav">

    <!-- Start Top Search -->
    <div class="container">
        <div class="row">
            <div class="top-search">
                <div class="input-group">
                    <form action="#">
                        <input type="text" name="text" class="form-control" placeholder="Search">
                        <button type="submit">
                            <i class="fas fa-search"></i>
                        </button>  
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Top Search -->

    <div class="container">

        <!-- Start Atribute Navigation -->
        <div class="attr-nav inc-btn">
            <ul>
                <li>
                    <a href="#">Daftar</a>
                </li>
                <li>
                    <a href="#">Masuk</a>
                </li>
            </ul>
        </div>        
        <!-- End Atribute Navigation -->

        <!-- Start Header Navigation -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="index-2.html">
                <img src="<?php echo base_url() ?>assets/img/logo.png" class="logo" alt="Logo">
            </a>
        </div>
        <!-- End Header Navigation -->

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-menu" >
            <ul class="nav navbar-nav navbar-left" data-in="#" data-out="#">
                <li class="dropdown">
                    <a href="<?php echo site_url(''); ?>"  >Beranda</a>
                   
                </li>
                <li>
					<a href="<?= site_url('index.php/tentang') ?>">Tentang</a>

				</li>
                <li>
                    <a href="<?php echo site_url('index.php/kursus'); ?>"  >Kursus</a>
                   
                </li>
                <li>
                    <a href="<?php echo site_url('index.php/instruktur'); ?>"  >Instruktur Kami</a>
                   
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>

</nav>
<!-- End Navigation -->

</header>