# Sowon

📣📣 这个仓库只是一个自用版本，提 issue 或了解更多信息，请查看[原仓库](https://github.com/tsoding/sowon) 

Sowon 是一个使用 SDL 库实现的计时软件。具体介绍，请参考[原始的 README.md](./README.orginal.md)

## 使用

### 模式

- 计时： `./sowon`
- 倒数：`./sowon <秒数>`
- 时钟：`./sowon clock`

### 标志

- 暂停状态启动：`./sowon -p <模式>`
- 倒计时结束后退出 sowon：`./sowon -e`

### 快捷键 
| 键 | 描述 |
|---|---|
| <kbd>空格</kbd> | 切换暂停 |
| <kbd>=</kbd> | 放大 |
| <kbd>-</kbd> | 缩小 |
| <kbd>0</kbd> | 100% 缩放 |
| <kbd>F5</kbd> | 重新开始 |
| <kbd>F11</kbd> | 全屏 |

## 构建

0. 环境

- windows 11（windows10 应该也可以）
- git for windows（主要是 git bash 及其一系列工具）
- zig 0.14.0-dev.1694+3b465ebec 或以上版本

1. 下载 SDL2 开发依赖

[SDL2-devel-2.30.8-mingw.zip](https://github.com/libsdl-org/SDL/releases/tag/release-2.30.8)，然后解压到 SDL2 目录。

2. 执行构建脚本

在 git bash 中执行：

```sh
sh build.sh
```

## LICENSE

见 [MIT](LICENSE)