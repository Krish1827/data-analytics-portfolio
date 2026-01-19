select *
from PortfolioProject..CovidDeaths
where continent is not null
order by 3,4

-- select *
-- from PortfolioProject..CovidVaccinations
-- order by 3,4

select Location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
where continent is not null
order by 1, 2

-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%states%'
order by 1, 2

-- Looking at the Total Cases vs Population
-- Shows what percentage of population got Covid

select Location, date, population, total_cases, (total_cases/population)*100 as InfectedPercentage
from PortfolioProject..CovidDeaths
-- where location like '%states%'
order by 1, 2

-- Looking at countries with Highest Infection Rate compared to Population

select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as InfectedPercentage
from PortfolioProject..CovidDeaths
-- where location like '%states%'
group by Location, Population
order by InfectedPercentage desc


-- Showing Countries with Highest Death Count per Population
select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
-- where location like '%states%'
where continent is not null
group by Location
order by TotalDeathCount desc

-- LET'S BREAK THINGS DOWN BY CONTINENT
select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
-- where location like '%states%'
where continent is not null
group by continent
order by TotalDeathCount desc
