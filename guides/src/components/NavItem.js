import * as React from 'react'
import PropTypes from 'prop-types'
import { Link } from 'gatsby'
import startCase from 'lodash.startcase'

const linkClasses = isActive =>
  `link mr4 fw4 f4 ${isActive ? 'dark-green' : 'dark-gray'}`

const NavItem = ({ url, children, isActive }) => {
  if (url.startsWith('http')) {
    return (
      <a className={linkClasses()} href={url} target="_blank">
        {startCase(children)}
      </a>
    )
  } else {
    return (
      <Link className={linkClasses(isActive)} to={url} activeClassName="green">
        {startCase(children)}
      </Link>
    )
  }
}

NavItem.propTypes = {
  url: PropTypes.string.isRequired,
  children: PropTypes.node.isRequired,
  isActive: PropTypes.bool
}

export default NavItem
