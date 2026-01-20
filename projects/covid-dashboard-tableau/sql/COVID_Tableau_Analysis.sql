-- 1.

select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
-- where location like '%states%'
where continent is not null
-- group by date
order by 1, 2

-- 2 

-- We take these out as they are not included in the above queries and want to stay consistent
-- European Union is part of Europe

select location, sum(cast(new_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
-- where location like '%states%'
where continent is null
and location not in ('World', 'European Union', 'International')
group by location
order by TotalDeathCount desc

-- 3

select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
-- where location like '%states%'
group by location, population
order by PercentPopulationInfected desc


-- 4

select location, population, date, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
-- where location like '%states%'
group by location, population, date
order by PercentPopulationInfected desc