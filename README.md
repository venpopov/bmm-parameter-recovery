Contains scripts and reports for parameter recovery simulations for models implemented in the [Bayesian Measurement Modeling](https://github.com/venpopov/bmm) (BMM) package.

This is organized as a Quatro project, just like the [Developer Notes](https://github.com/venpopov/bmm-dev-notes). It will appear as a tab on the BMM website. A GitHub action will push the contents of the `_site` folder changes here to the BMM website.

## How to update

1. Clone this repository
2. When you open the project in RStudio for the first time, renv should install itself. If not, run `install.packages("renv")` in R
3. Run `renv::restore()` in R to install the necessary packages for the project. Run this command whenever you resume work on the project after a break, in case some packages have been updated by one of the collaborators.
4. Put any functions you want to use in the `R/` folder
5. Put any scripts you want to run in the `scripts/` folder
6. Computational outputs (e.g., simulations, figures, tables) should be saved in the `output/` folder
7. Report your recovery results in a new Quarto file in the `reports/` folder
8. Run `quarto render` in the terminal to render the reports to HTML in the `_site/` folder
9. Push your changes to GitHub

If you install a new package, run `renv::snapshot()` to update the `renv.lock` file. This will ensure that the package is installed when the project is cloned by someone else.


