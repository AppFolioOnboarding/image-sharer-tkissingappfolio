import { expect } from 'chai';
import { shallow } from 'enzyme';
import { describe, it } from 'mocha';
import React from 'react';

import App from '../App';
import Footer from '../Footer';
import Header from '../Header';
import FeedbackFrom from '../FeedbackForm';

describe('<App />', () => {
  const wrapper = shallow(<App />);

  it('should have a header and footer', () => {
    expect(wrapper.find(Footer)).to.be.lengthOf(1);
    expect(wrapper.find(Header)).to.be.lengthOf(1);
  });

  it('should have a FeedbackForm', () => {
    expect(wrapper.find(FeedbackFrom)).to.be.lengthOf(1);
  });
});
