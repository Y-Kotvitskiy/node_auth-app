import mateAcademyEslintConfig from '@mate-academy/eslint-config';

export default [
  ...mateAcademyEslintConfig,
  {
    languageOptions: {
      globals: {
        jest: true,
      },
    },
    plugins: {
      jest,
    },
    rules: {
      'no-proto': 'off',
    },
  },
];
